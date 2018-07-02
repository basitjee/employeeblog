import { Component, OnInit } from '@angular/core';
import {environment} from '../../environments/environment';
import {HttpClient} from '@angular/common/http';
import {ActivatedRoute, Router} from '@angular/router';
import {User} from '../Shared/User';
import {el} from '@angular/platform-browser/testing/src/browser_util';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  public username;

  public loginStatus: boolean;
  public incompleteUserData: boolean;
  public usernameTaken: boolean;
  public userCreated = false;

  public User = new User();
  constructor(private http: HttpClient, private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('isLoggedIn') === '1') {
      this.router.navigate(['/admin/dashboard']);
    }

  }

  login() {
    let data = {
      username: this.username
    };

    this.http.post(environment.apiBaseUrl + '/login',  data).toPromise()
      .then(res => {
        console.log('Result', res);
        if(res !== -1) {
          this.loginStatus = true;
          if (localStorage.getItem('email') !== res[0]['email']) {
            console.log('New User');
            localStorage.setItem('isLoggedIn', '1');
            localStorage.setItem('user_id', res[0]['id']);
            localStorage.setItem('name', res[0]['name']);
            localStorage.setItem('email', res[0]['email']);
          }
          else {
            console.log('Known user');
            localStorage.setItem('isLoggedIn', '1');
          }
          this.router.navigate(['/admin/dashboard']);
        }
        else {
          this.loginStatus = false;
        }
      })
      .catch(err => {
        console.log('error', err);
      });
  }

  newUser() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'block';
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

  registerNewUser() {
    this.checkUsername();
    if (!this.User.name || !this.User.email || !this.User.username)
    {
      this.incompleteUserData = true;
    }
    else if (!this.usernameTaken) {
      let data = {
        user: this.User
      };

      this.http.post(environment.apiBaseUrl + '/newUser', data).toPromise()
        .then(res => {
          if (res === 1) {
            this.userCreated = true;
            var modal = document.getElementById('myModal');
            modal.style.display = 'none';
          }
          else {
            this.usernameTaken = true;
          }
        })
        .catch(err => {
          console.log('error', err);
        });
    }
    else
    {
      this.usernameTaken = true;
    }
  }

  checkUsername() {
    let data = {
      username: this.User.username
    };

    this.http.post(environment.apiBaseUrl + '/checkUsername', data).toPromise()
      .then(res => {
        if (res === 1) {
          this.usernameTaken = true;
        }
        else {
          return false;
        }
      })
      .catch(err => {
        console.log('error', err);
      });
  }

}
