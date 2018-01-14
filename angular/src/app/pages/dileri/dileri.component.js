"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require("@angular/core");
require("rxjs/Rx");
var dileri_service_1 = require("../../services/dileri.service");
var router_1 = require("@angular/router");
var DileriComponent = (function () {
    function DileriComponent(dileriService, route) {
        var _this = this;
        this.dileriService = dileriService;
        this.route = route;
        var $;
        this.sub = this.route.params.subscribe(function (params) {
            _this.id = +params['id'];
        });
    }
    DileriComponent.prototype.ngOnInit = function () {
        this.loadProdavnice();
    };
    DileriComponent.prototype.loadProdavnice = function () {
        var _this = this;
        var $;
        this.dileriService.getProdavnice().subscribe(function (data) {
            _this.dileri = data;
            setInterval(function () {
                $ = window['jQuery'];
                $('table').DataTable();
            }.bind(_this), 400);
        });
    };
    DileriComponent.prototype.ngOnDestroy = function () {
        this.sub.unsubscribe();
    };
    return DileriComponent;
}());
DileriComponent = __decorate([
    core_1.Component({
        selector: 'dileri',
        templateUrl: './dileri.html',
        styleUrls: ['./dileri.css'],
    }),
    __metadata("design:paramtypes", [dileri_service_1.default, router_1.ActivatedRoute])
], DileriComponent);
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = DileriComponent;
//# sourceMappingURL=dileri.component.js.map