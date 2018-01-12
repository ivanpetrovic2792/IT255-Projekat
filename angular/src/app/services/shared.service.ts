import {Injectable} from "@angular/core";
import {Headers} from "@angular/http";

@Injectable()
export class SharedService {
    headers = new Headers();
    constructor() {
        this.headers.append('Content-Type', 'application/x-www-form-urlencoded');
        if (localStorage.getItem('token')) {
            this.headers.append('token', localStorage.getItem('token'));
        }
    }

    getHeaders(): Headers {
        return this.headers;
    }

}
//isto imam u konstantama, sluzi za povlacenje tokena i pripremanje hedera 