"use strict";
var home_component_1 = require("./pages/home/home.component");
var register_component_1 = require("./pages/register/register.component");
var login_component_1 = require("./pages/login/login.component");
var korpa_component_1 = require("./pages/korpa/korpa.component");
var adminpanel_component_1 = require("./pages/adminPanel/adminpanel.component");
var onama_component_1 = require("./pages/onama/onama.component");
var proizvodi_component_1 = require("./pages/proizvodi/proizvodi.component");
var modeli_component_1 = require("./pages/modeli/modeli.component");
var kontakt_component_1 = require("./pages/kontakt/kontakt.component");
var dileri_component_1 = require("./pages/dileri/dileri.component");
exports.appRoutes = [
    { path: '', component: home_component_1.default },
    { path: 'register', component: register_component_1.default },
    { path: 'login', component: login_component_1.default },
    { path: 'korpa', component: korpa_component_1.default },
    { path: 'admin', component: adminpanel_component_1.default },
    { path: 'onama', component: onama_component_1.default },
    { path: 'proizvodi/:id', component: proizvodi_component_1.default },
    { path: 'modeli', component: modeli_component_1.default },
    { path: 'kontakt', component: kontakt_component_1.default },
    { path: 'dileri/:id', component: dileri_component_1.default },
];
//# sourceMappingURL=app.router.js.map