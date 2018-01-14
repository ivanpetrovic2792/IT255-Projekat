import {Component, OnDestroy, OnInit} from '@angular/core';
import 'rxjs/Rx';
import Dileri from "../../model/dileri";
import ProdavniceService from "../../services/dileri.service";
import { ActivatedRoute } from '@angular/router';

@Component({
    selector: 'dileri',
    templateUrl: './dileri.html',
    styleUrls : ['./dileri.css'],
})
export default class DileriComponent implements OnInit, OnDestroy  {

    id: number;
    dileri: Dileri[];
    private sub: any;

    constructor(private dileriService: ProdavniceService,private route: ActivatedRoute) {
        var $:any;
        this.sub = this.route.params.subscribe(params => {
            this.id = +params['id'];

        });

    }
    ngOnInit() {
        this.loadProdavnice();
    }

    loadProdavnice() {
        var $:any;
        this.dileriService.getProdavnice().subscribe(data => {
            this.dileri = data;
            setInterval(function(){
                $ = window['jQuery'];
                $('table').DataTable();
            }.bind(this),400);
        });


    }

    ngOnDestroy(){
        this.sub.unsubscribe();

    }

}
