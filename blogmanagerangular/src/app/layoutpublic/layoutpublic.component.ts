import { Component, OnInit } from '@angular/core';
import {Post} from '../Shared/Post';
import {Comment} from '../Shared/Comment';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../environments/environment';
import {post} from 'selenium-webdriver/http';
import {ActivatedRoute, Router} from '@angular/router';
import {el} from '@angular/platform-browser/testing/src/browser_util';
import {a} from '@angular/core/src/render3';
import {PostCommentCount} from '../Shared/PostCommentCount';
import {forEach} from '@angular/router/src/utils/collection';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-layoutpublic',
  templateUrl: './layoutpublic.component.html',
  styleUrls: ['./layoutpublic.component.css']
})
export class LayoutpublicComponent implements OnInit {

  public posts: Array<Post>;
  public comments: Array<Comment>;
  public users: any;

  public postCommentCount: Array<PostCommentCount>;
  public userComment = new Comment();
  public blogpostId;

  public classNames = ['blog-list-box border-gradient-def mb-30', 'blog-list-box border-gradient-reg mb-30',
    'blog-list-box border-gradient-info mb-30',
    'blog-list-box border-gradient-pri mb-30'
  ];
  public iterator = 0;

  public incompleteCommentData: boolean;
  public commentCount = 0;
  constructor(private http: HttpClient, private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.http.post(environment.apiBaseUrl + '/getAllPosts', 1).toPromise()
      .then(res => {
        this.posts = res['posts'];
        this.comments = res['comments'];
        this.users = res['users'];

        console.log('Success', res);
      })
      .catch(err => {
        console.log('error', err);
      });

    this.calculatePostCommentCount();
  }

  CommentModal(blogpost_id) {
    var modal = document.getElementById('myModal');
    modal.style.display = 'block';
    this.blogpostId = blogpost_id;
    this.userComment.blogpost_id = this.blogpostId;
    // Get the button that opens the modal
    var btn = document.getElementById('myBtn');

    // Get the <span> element that closes the modal
    var span : any = document.getElementsByClassName('btn btn-danger')[0];
    span.onclick = function() {
      modal.style.display = 'none';
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target === modal) {
        modal.style.display = 'none';
      }
    };
  }

  newComment() {
    if (!this.userComment.name || !this.userComment.email || !this.userComment.content) {
      this.incompleteCommentData = true;
    }
    else if(!this.validateEmail(this.userComment.email)) {
      this.incompleteCommentData = true;
    }
    else {
      let data = {
        comment: this.userComment
      };

      this.http.post(environment.apiBaseUrl + '/new-comment', data).toPromise()
        .then(res => {
          console.log('Success', res);
        })
        .catch(err => {
          console.log('error', err);
        });

      window.location.reload();

    }
  }

  incrementComment() {
    this.commentCount++;
  }
  resetCommentCount() {
    this.commentCount = 0;
  }


  expandComments() {
    var coll = document.getElementsByClassName('collapsible');
    var i;

    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener('click', function() {
        this.classList.toggle('active');
        var content = this.nextElementSibling;
        if (content.style.display === 'block') {
          content.style.display = 'none';
        } else {
          content.style.display = 'block';
        }
      });
    }
  }

  validateEmail(email)
  {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
  }

  iterateIndex() {
    if (this.iterator === 3) {
      this.iterator = 0;
    }
    else {
      this.iterator++;
    }
  }

  calculatePostCommentCount() {
    console.log('Type:' ,typeof this.comments);
  }

}
