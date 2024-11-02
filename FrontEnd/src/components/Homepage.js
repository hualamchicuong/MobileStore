import React, {useEffect, useRef, useState} from "react";
import {Link, useNavigate} from "react-router-dom";
import BannerSlider from "./Tools/BannerSlider";
import ProductSlider from "./Tools/ProductSlider";

import "../style/Homepage.css";
import {useKeycloak} from "@react-keycloak/web";

const Homepage = () => {
    const [productData, setProductData] = useState([]);
    const [productImg, setProductImg] = useState([]);
    const [productSys, setProductSys] = useState([]);
    const navigate = useNavigate();
    const { keycloak, initialized } = useKeycloak();



    useEffect(() => {

        async function getProduct() {
                const response = await fetch(`http://localhost:8081/api/sp/product/list`);
                const data = await response.json();
                const groupedProducts = groupBy(data, 'name');

                const uniqueProducts = Object.values(groupedProducts).map(group => group[0]);

                setProductData(uniqueProducts);
        }
        getProduct();
        console.log(productData);

    }, []);

    useEffect(() => {
        async function getProductImg() {
            const response = await fetch(`http://localhost:8081/api/sp/product/2/img`);
            const data = await response.json();
            data.splice(0, 1);
            setProductImg(data);
        }
        getProductImg();
    }, []);

    useEffect( () => {
        if (keycloak.authenticated) {
            for (let i = 0; i < keycloak.tokenParsed.resource_access.React.roles.length; i++) {
                if (keycloak.tokenParsed.resource_access.React.roles[i] === "Admin") {
                    navigate(`/manageAccount`);
                }
            }
        }
    })


    function groupBy(array, property) {
        return array.reduce((result, item) => {
            const key = item[property];
            if (!result[key]) {
                result[key] = [];
            }
            result[key].push(item);
            return result;
        }, {});
    }



    return (
        <>
            <div className="Title"></div>
            <div className="banner-img" style={{zIndex:"-1"}}>
                <BannerSlider images={productImg.map((image) => image.img_path)}/>
            </div>
            <div id="productName" className="productContainer">
                <ProductSlider products={productData}/>
            </div>
        </>

    );
};

export default Homepage;