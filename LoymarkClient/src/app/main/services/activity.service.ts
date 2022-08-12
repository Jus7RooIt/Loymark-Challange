import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Activity } from 'src/app/interfaces/activity.interface';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ActivityService {


  constructor(
    private http: HttpClient,
    private router: Router
  ) { }
  private _baseUrl: string = environment.apiUrl

  GetAllActivities(): Promise<Activity[]> {
    const url = `${this._baseUrl}/api/Activities/GetAllActivities`
    console.log(url);
    return new Promise((resolve, reject) => {
      this.http.get<Activity[]>(url)
        .subscribe(
          (res: Activity[]) => {
            // console.log(res);
            resolve(res)
          },
          err => {
            console.log(err)
            reject(err)
          }
        )
    })
  }
}
