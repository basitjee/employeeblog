import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '', loadChildren: './layoutpublic/layoutpublic.module#LayoutpublicModule' },
  { path: 'admin', loadChildren: './layoutadmin/layoutadmin.module#LayoutAdminModule' },
  { path: 'login', loadChildren: './login/login.module#LoginModule' }
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
