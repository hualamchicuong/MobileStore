import React, { useEffect, useState } from 'react';
import {Link, useNavigate, useParams} from "react-router-dom";
import '../style/Header.css'

const Footer = () =>{
    return (
        <>
            <h1 style={{backgroundColor:"#262626",position:"absolute",top:"100",width:"100vw",fontWeight:"normal", color:"white", textAlign: "center", height: "5%", fontSize:"25px", paddingTop: "4%", marginTop: "50px"}}>@My First Java Web</h1>
        </>
    )
}

export default Footer;