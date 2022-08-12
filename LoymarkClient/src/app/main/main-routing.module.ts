import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { UserlistComponent } from './components/userlist/userlist.component';
import { NewuserComponent } from './components/newuser/newuser.component'
import { ActivitylistComponent } from './components/activitylist/activitylist.component';
import { HomeComponent } from './components/home/home.component';



export const routes: Routes = [
  {
    path: "",
    // redirectTo: 'home',

    children: [
      {
        path: 'userlist',
        component: UserlistComponent,
        // pathMatch: 'full',
      },
      {
        path: 'newuser',
        component: NewuserComponent,
        // pathMatch: 'full',
      },
      {
        path: 'edituser/:idUser',
        component: NewuserComponent,
        // pathMatch: 'full',
      },
      {
        path: 'activitylist',
        component: ActivitylistComponent,
        // pathMatch: 'full',
      },
      {
        path: 'home',
        component: HomeComponent,
        // pathMatch: 'full',
      },
      // {
      //   path: '**',
      //   redirectTo: 'home',
      // },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class MainRoutingModule { }
