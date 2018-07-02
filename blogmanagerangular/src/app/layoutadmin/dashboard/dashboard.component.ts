import { Component, OnInit } from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {Post} from '../../Shared/Post';
import {el} from '@angular/platform-browser/testing/src/browser_util';
import {Router} from '@angular/router';

declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  public post = new Post();

  public invalidPostData: boolean;

  public postCount: any;

  public posts: Array<Post>;
  public comments: Array<Comment>;

  public user: any;

  public commentCount = 0;

  public user_id;
  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit() {
    this.user_id = localStorage.getItem('user_id').toString();
    this.post.user_id  =  this.user_id;

    let data = {
      user_id: this.user_id
    };

    this.http.post(environment.apiBaseUrl + '/getUserPosts',  data).toPromise()
      .then(res => {
        this.posts = res['posts'];
        this.comments = res['comments'];
        this.user = res['user'];

        console.log('Success', res);
      })
      .catch(err => {
        console.log('error', err);
      });

    let data1 = {
      user_id: this.user_id
    };


    this.http.post(environment.apiBaseUrl + '/getUserPostCount',  data1).toPromise()
      .then(res => {
        this.postCount = res;
        console.log('Success', res);
      })
      .catch(err => {
        console.log('error', err);
      });

  }

  newPost() {
    if (!this.post.post_title || !this.post.post_content) {
      this.invalidPostData = true;
    }
    else {
      let data = {
        post: this.post
      };

      this.http.post(environment.apiBaseUrl + '/new-post', data).toPromise()
        .then(res => {
          console.log('Success', res);
          window.location.reload();
        })
        .catch(err => {
          console.log('error', err);
        });
    }
  }
  showComments() {
    $('#commentsDiv').show();
  }

  incrementComment() {
    this.commentCount++;
  }
  resetCommentCount() {
    this.commentCount = 0;
  }

  logout() {
    localStorage.removeItem('isLoggedIn');
    localStorage.setItem('isLoggedIn', '0');
    this.router.navigateByUrl('');
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


}
