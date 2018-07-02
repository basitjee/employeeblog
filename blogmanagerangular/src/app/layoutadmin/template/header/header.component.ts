import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  public name = localStorage.getItem('name');
  public email = localStorage.getItem('email');
  constructor(private router: Router) { }

  ngOnInit() {}

  logout() {
    localStorage.removeItem('isLoggedIn');
    localStorage.setItem('isLoggedIn', '0');
    this.router.navigateByUrl('');
  }

}
