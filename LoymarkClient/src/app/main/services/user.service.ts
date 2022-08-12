import { Injectable, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { environment as env } from 'src/environments/environment';

import { HttpClient } from '@angular/common/http';
import { User } from 'src/app/interfaces/user.interface';

interface respCode {
  code?: number
  message?: string
}


@Injectable({
  providedIn: 'root'
})
export class UserService implements OnInit {

  private apiUrl: string = env.apiUrl + '/api/Users';


  constructor(
    private http: HttpClient,
    private router: Router
  ) { }
  isEditUsery: boolean = false;
  editUser: User = {
    idUser: 0,
    name: "",
    lastName: "",
    birthDate: new Date,
    countryCode: "",
    isNewsletterConfirmed: false,
    email: "",
    phoneNumber: ""
  };

  private _baseUrl: string = env.apiUrl
  public cancelRedirection: boolean = false

  ngOnInit() {
  }

  getAllUsers(): Promise<User[]> {
    const url = `${this._baseUrl}/api/Users/GetAll`
    console.log(url);
    return new Promise((resolve, reject) => {
      this.http.get<User[]>(url)
        .subscribe(
          (res: User[]) => {
            console.log(res);
            resolve(res)
          },
          err => {
            console.log(err)
            reject(err)
          }
        )
    })
  }
  GetById(idUser: number): Promise<User> {
    const url = `${this._baseUrl}/api/Users/GetById?id=${idUser}`
    // console.log(url);
    return new Promise((resolve, reject) => {
      this.http.get<User>(url)
        .subscribe(
          (res: User) => {
            // console.log(res);
            resolve(res)
          },
          err => {
            // console.log(err)
            reject(err)
          }
        )
    })
  }

  //Metodo hace update de user
  SaveUpdateUser(user: User): Promise<respCode> {
    const url = `${this._baseUrl}/api/Users/UpdateUser`
    return new Promise((resolve, reject) => {
      this.http.patch<respCode>(url, user).subscribe(
        (res: respCode) => {
          resolve(res)
        },
        (err) => {
          if (err.status == 400) {
            const errorCode = err.error.errorCode
            reject(errorCode)
          }
          else {
            reject(err.status)
          }
        }
      )
    })
  }

  //Metodo hace insert de user
  SaveCreateUser(user: User): Promise<respCode> {
    const url = `${this._baseUrl}/api/Users/CreateUser`
    console.log('user');
    console.log(user);

    return new Promise((resolve, reject) => {
      this.http.post<respCode>(url, user).subscribe(
        (res: respCode) => {
          resolve(res)
        },
        (err) => {
          console.log(err)
          if (err.status == 412) {
            console.log('es 412')
            const errorCode = err.message
            reject(errorCode)
          }
          else {
            console.log('no es 412')

            reject(err.status)
          }
        }
      )
    })
  }

  // METODO para dar de baja una company
  delete(idUser: number): Promise<boolean> {
    console.log(idUser);

    let user: User = {
      idUser: idUser,
    }
    const url = `${this._baseUrl}/api/Users/DeleteUser`;
    console.log('url: ' + url);
    return new Promise((resolve, reject) => {
      this.http.post<boolean>(url, user).subscribe(
        (res: boolean) => {
          resolve(res)
        },
        (err) => {
          if (err.status == 400) {
            const errorCode = err.error.errorCode
            reject(errorCode)
          }
          else {
            reject(err.status)
          }
        }
      )
    })
  }

}
