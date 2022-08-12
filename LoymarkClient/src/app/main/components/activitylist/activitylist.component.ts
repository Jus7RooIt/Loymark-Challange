import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { Activity } from 'src/app/interfaces/activity.interface';
import { ActivityService } from '../../services/activity.service';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-activitylist',
  templateUrl: './activitylist.component.html',
  styleUrls: ['./activitylist.component.css']
})
export class ActivitylistComponent implements OnInit {

  public activitiesArray: Activity[] = []
  dataSource!: MatTableDataSource<any>;
  displayedColumns: string[] = [
    // 'idActivity',
    'type',
    'creationDate',
    'user',
    'detail',
  ];

  constructor(
    private activityService: ActivityService,
    private router: Router
  ) {
  }

  ngOnInit(): void {
    this.GetActivities();
  }

  GetActivities() {
    console.log('start buscarComentarios CommComp')
    this.activityService.GetAllActivities()
      .then(
        (resp) => {
          this.activitiesArray = resp;
          this.dataSource = new MatTableDataSource<any>(resp);
          console.log("resp get user comp");
          console.log(resp);
        }
      );
  }

}
