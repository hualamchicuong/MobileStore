import React, { Component } from 'react';
import { Route, Routes } from 'react-router-dom';
import ProductDetail from "./components/ProductDetail";
import './App.css';
import Header from "./components/Header";
import Nav from "./components/Nav";
import ProductType from "./components/ProductType";
import Cart from "./components/Cart";
import UserInfo from "./components/UserInfo";
import Homepage from "./components/Homepage";
import ConfirmOrder from "./components/ConfirmOrder";
import OrderHistory from "./components/OrderHistory";
import OrderDetail from "./components/OrderDetail";
import AdminPage from "./components/AdminComponents/AdminPage";
import ManageOrderRequest from "./components/AdminComponents/ManageOrderRequest";
import {useKeycloak} from "@react-keycloak/web";


import NavBar from "./components/AdminComponents/NavBar";
import ManageAccount from "./components/AdminComponents/ManageAccount";
import UserDetailAdminView from "./components/AdminComponents/UserDetailAdminView";
import ManageProduct from "./components/AdminComponents/ManageProduct";
import ProductDetailAdminView from "./components/AdminComponents/ProductDetailAdminView";
import Footer from "./components/Footer";

class App extends Component {
    render()
    {
        return (
            <>
                <Header />
                <Nav />
                <Routes>
                    <Route exact path="/" element={<Homepage />} />
                    <Route path="/product/:id" element={<ProductDetail />} />
                    <Route path="/product/type/:type" element={<ProductType />}/>
                    <Route path="/cart/:cart_id" element={<Cart />}/>
                    <Route path="/userinfo/:user_id" element={<UserInfo />}/>
                    <Route path="/confirmOrder" element={<ConfirmOrder />}/>
                    <Route path="/orderHistory" element={<OrderHistory />}/>
                    <Route path="/orderDetail" element={<OrderDetail />}/>
                    <Route path="/admin" element={<AdminPage/>}/>
                    <Route path="/manageOrder" element={<ManageOrderRequest/>}/>
                    <Route path="/manageAccount" element={<ManageAccount/>}/>
                    <Route path="/manageProduct" element={<ManageProduct/>}/>
                    <Route path="/userdetailAdminView/:uid" element={<UserDetailAdminView/>}/>
                    <Route path="/productdetailAdminView/:productID" element={<ProductDetailAdminView/>}/>
                </Routes>
                {/*<Footer/>*/}
            </>
    );}
}

export default App;