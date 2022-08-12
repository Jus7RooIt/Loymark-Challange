import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'src/app/interfaces/user.interface';
import { UserService } from '../../services/user.service';

import { switchMap } from 'rxjs';
import { Country } from 'src/app/interfaces/country.interface';
import { CountryService } from '../../services/country.service';

import Swal from 'sweetalert2';

interface Food {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-newuser',
  templateUrl: './newuser.component.html',
  styleUrls: ['./newuser.component.css'],

})
export class NewuserComponent implements OnInit {
  // date = new FormControl(moment());
  // animalControl = new FormControl<Animal>(null, Validators.required);
  selectFormControl = new FormControl('', Validators.required);

  countries: Country[] = [
    { countryCode: 'arg', name: 'Argentina' },
    { countryCode: 'usa', name: 'Estados Unidos' },
    { countryCode: 'bra', name: 'Brasil' },
  ];

  //creo la propiedad form de tipo formgroup para mi formulario
  form: FormGroup;
  isEdit: boolean = false;
  formIsValid: boolean = false;
  editUser: User | undefined;
  nombre: string = ''
  private _idUser: number = 0;


  constructor(
    private fb: FormBuilder,
    // private _snackBar: MatSnackBar,
    private router: Router,
    private activatedRoute: ActivatedRoute,

    private userService: UserService,
    private CountryService: CountryService,
  ) {
    this.editUser = {
      idUser: 0,
      isNewsletterConfirmed: true
    }

    //inicio el form group con los campos y sus validaciones
    let emailPattern: string = '^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$';
    let lettersPattern: string = '^[A-Za-zñÑáéíóúÁÉÍÓÚ ]+$';
    let numberPattern: string = '^[0-9]*$';
    // let datePattern: string = '^[0-9]*$';

    this.form = this.fb.group({
      name: [
        this.editUser!.name, [
          Validators.required,
          Validators.pattern(lettersPattern),
          Validators.maxLength(50)
        ]
      ],
      lastName: [
        this.editUser!.lastName, [
          Validators.required,
          Validators.pattern(lettersPattern),
          Validators.maxLength(50)
        ]
      ],
      email: [
        this.editUser!.email, [
          Validators.required,
          Validators.pattern(emailPattern),
          Validators.maxLength(50)
        ]
      ],
      phoneNumber: [
        this.editUser!.phoneNumber, [
          Validators.pattern(numberPattern),
        ]
        // Validators.maxLength(20)
      ],

      countryCode: [
        this.editUser!.countryCode, [
          Validators.required,
          // Validators.minLength(3),
          // Validators.maxLength(3),
        ]
      ],
      isNewsletterConfirmed: [
        this.editUser!.isNewsletterConfirmed, [
          Validators.required
        ]
      ],
      birthDate: [
        this.editUser!.birthDate, [
          Validators.required,
          // Validators.pattern(datePattern),
          Validators.maxLength(10)
        ]
      ],
    });
  }

  //Creo un get para checkear si estoy en edit desde el service
  get _isEdit(): boolean {
    // this.isEdit = false
    return this.isEdit
  }


  loadUser() {
    if (this.router.url.includes('edit')) {
      this.activatedRoute.params
        .pipe(switchMap(({ idUser }) => this.userService.GetById(idUser)))
        .subscribe(
          (user) => (
            this.form.patchValue(user),
            (this._idUser = user.idUser),
            (this.isEdit = true),
            (console.log('edit _idUser: ' + this._idUser)),
            (console.log('edit user.iduser: ' + user.idUser)),
            (this.form.markAllAsTouched())
            // this.form.controls['fecha_nacimiento'].setValue(
            //   this.datePipe.transform(user.fecha_nacimiento, 'yyyy-MM-dd')
            // )
          )
        );
      return;
    }
    else {
      this.isEdit = false;
      return;
    }
  }

  ngOnInit(): void {
    this.LoadContries();
    this.loadUser();
  }
  LoadContries() {
    this.CountryService.GetAllCountries()
      .then(
        (resp) => {
          this.countries = resp;
          // console.log(resp);
          // this.allClients.forEach(element => {
          //   if (element.isCompany) {
          //     this.CompaniesArrayRecent.push(element);
          //   }
          //   else {
          //     this.clientsArrayRecent.push(element);
          //   }
          // });

        }

      );
  }

  //Metodo al hacer click en Crear o Actualizar
  Save() {
    //Si viene por edit voy al metodo update sino a guardar
    if (!this._isEdit)
      this.StartInsert()
    else
      this.StartUpdate()

  }
  //Metodo que llama al Insert del UserService
  StartInsert() {
    // genero el objeto user con los valores de los input
    const user: User = {
      idUser: 0,
      name: this.form.value.name,
      lastName: this.form.value.lastName,
      birthDate: this.form.value.birthDate,
      countryCode: this.form.value.countryCode,
      email: this.form.value.email,
      phoneNumber: this.form.value.phoneNumber,
      isNewsletterConfirmed: this.form.value.isNewsletterConfirmed
    }
    //llamo al metodo del service le paso el objeto
    this.userService.SaveCreateUser(user)

      // Si recibo un respuesta mando mensaje de que se guardo y navego a la pantalla inicial de admin
      .then((res) => {
        if (res) {
          this.router.navigateByUrl('main/userlist')
        }
      }
      )
      //si trae un error la manejo con un mensaje y consola
      .catch((error) => {
        Swal.fire('Advertencia', 'El email ya existe', 'error');
        return
      })
  }
  //Metodo que llama al Update del UserService
  StartUpdate() {
    // genero el objeto user con los valores de los input
    const user: User = {
      idUser: this._idUser,
      name: this.form.value.name,
      lastName: this.form.value.lastName,
      birthDate: this.form.value.birthDate,
      countryCode: this.form.value.countryCode,
      email: this.form.value.email,
      phoneNumber: this.form.value.phoneNumber,
      isNewsletterConfirmed: this.form.value.isNewsletterConfirmed
    }
    //llamo al metodo del service le paso el objeto
    this.userService.SaveUpdateUser(user)

      // Si recibo un respuesta mando mensaje de que se guardo y navego a la pantalla inicial de admin
      .then((res) => {
        if (res) {
          // this.succesMessage('Se guardo correctamente')
          console.log('Se guardo correctamente')
          this.router.navigateByUrl('main/userlist')
        }
      }
      )
      //si trae un error la manejo con un mensaje y consola
      .catch((error) => {
        Swal.fire('Advertencia', 'El email ya existe', 'error');
        return
      })

  }
}
