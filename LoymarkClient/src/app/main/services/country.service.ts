import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Country } from 'src/app/interfaces/country.interface';
import { environment as env } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CountryService {

  constructor(
    private http: HttpClient,
    private router: Router
  ) { }
  private _baseUrl: string = env.apiUrl

  GetAllCountries(): Promise<Country[]> {
    const url = `${this._baseUrl}/api/Countries/GetAllCountries`
    console.log(url);
    return new Promise((resolve, reject) => {
      this.http.get<Country[]>(url)
        .subscribe(
          (res: Country[]) => {
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
