import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';

import { User } from 'src/app/interfaces/user.interface';
import { UserService } from '../../services/user.service';
import { ConfirmModalComponent } from '../confirm-modal/confirm-modal.component';

@Component({
  selector: 'app-userlist',
  templateUrl: './userlist.component.html',
  styleUrls: ['./userlist.component.css']
})
export class UserlistComponent implements OnInit {

  public usersArray: User[] = []
  dataSource!: MatTableDataSource<any>;
  displayedColumns: string[] = [
    // 'idUser',
    'lastName',
    'name',
    'email',
    'birthDate',
    'phoneNumber',
    'countryCode',
    // 'country',
    'isNewsletterConfirmed',
    'actions'
  ];

  constructor(
    private userService: UserService,
    private router: Router,
    public dialog: MatDialog

  ) {
  }

  ngOnInit(): void {
    this.GetUsers();
  }
  GetUsers() {
    console.log('start buscarComentarios CommComp')
    this.userService.getAllUsers()
      .then(
        (resp) => {
          this.usersArray = resp;
          this.dataSource = new MatTableDataSource<any>(resp);
          console.log("resp get user comp");
          console.log(resp);
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


  //Funcion que redirecciona a la pantalla de nuevo usuario, con la ruta para saber si es visualizacion o edicion.
  redirect(idUser: number, route: string) {
    console.log(idUser)
    const idString = idUser.toString();
    this.router.navigateByUrl(
      `main/edituser/${idString}`,
      {
        skipLocationChange: true,
      },
    );
  }

  delete(idUser: number) {
    console.log(idUser);
    this.userService.delete(idUser)

      .then((res: boolean) => {
        console.log(res)
        // this.SuccesMessage("Se elimino la compañia correctamente")
        this.GetUsers()
      }
      )
      .catch((error) => {
        if (error.status == 400) {
        }
        // this.errorMessage("No se pudo eliminar la compañia")
        console.log('Error: ', error.error)
      })

  }

  userSelected: User = { idUser: 0 }

  openDialogDelete(user: User): void {
    this.userSelected = user
    const dialogRef = this.dialog.open(ConfirmModalComponent, {
      width: '400px',
      data: {
        name: user.name + " " + user.lastName,
        respuesta: 0
      }

    });

    dialogRef.afterClosed().subscribe(result => {
      if (result == true) {
        this.delete(this.userSelected.idUser)
        // this.SuccesMessage("Se eliminó el arbol correctamente")
        this.GetUsers()
      }
    });
  }




}
