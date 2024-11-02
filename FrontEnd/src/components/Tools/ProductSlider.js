import React, { useEffect, useState, useRef } from 'react';
import Slider from 'react-slick';
import { Link } from 'react-router-dom';
import '../../style/ProductSlider.css';
import '../../style/ProductType.css';
import { AiFillCaretLeft, AiFillCaretRight } from "react-icons/ai";


function ProductSlider({ products }) {
    const sliderRef = useRef(null);
    const [currentIndex, setCurrentIndex] = useState(0);
    const [productSys, setProductSys] = useState([]);


    const sliderSettings = {
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 3,
        slidesToScroll: 3,
        initialSlide: currentIndex,
        nextArrow: <NextArrow />,
        prevArrow: <PrevArrow />,
        beforeChange: (current, next) => setCurrentIndex(next),
    };

    const productsByType = {};

    products.forEach((product) => {
        if (!productsByType[product.type]) {
            productsByType[product.type] = [];
        }
        productsByType[product.type].push(product);
    });

    function NextArrow(props) {
        const { className, style, onClick } = props;
        return (
            <div className={className} style={{ ...style }} onClick={onClick}>
                <AiFillCaretLeft />
            </div>
        );
    }

    function PrevArrow(props) {
        const { className, style, onClick } = props;
        return (
            <div className={className} style={{ ...style }} onClick={onClick}>
                <AiFillCaretRight />

            </div>
        );
    }

    const getProductSys = async(product_id) =>{
        const response = await fetch(`http://localhost:8081/api/sp/product/${product_id}/sys`);
        const data = await response.json();
        let temp = [];
        for(let i=0;i<data.length;i++){
            if(data[i].name === 'Model' || data[i].name === 'Kích thước' || data[i].name === 'Độ phân giải' || data[i].name === 'Hệ điều hành' || data[i].name === 'Trọng lượng'){
                temp.push(data[i]);
            }
        }

        setProductSys(temp);
    }


    return (
        <div className="product-slider">
            {Object.keys(productsByType).map((type) => (
                <div key={type}>
                    {type && <h1 className="productType">{type}</h1>}
                    {Array.isArray(productsByType[type]) && productsByType[type].length > 0 ? (
                        <div className="ProductSlider_Container">
                            <div>
                                    {productsByType[type].map((product, index) => (
                                        <div className="product-items" key={index}>
                                            <div>
                                                <Link to={`/product/${product.id}`}  style={{textDecoration: 'none', color: 'black', fontSize:'20px'}} onMouseEnter={() => getProductSys(product.id)}>
                                                    <div className="product-style" style={{display:"flex", flexDirection:"column", alignItems: "center"}}>
                                                            <img className="product-images" src={product.image} alt={product.name} />
                                                            <div className="product-names" >{product.name}</div>

                                                    </div>
                                                </Link>
                                            </div>
                                        </div>
                                    ))}

                                {/*<div className="navigation">*/}
                                {/*    <button className="prev" onClick={() => sliderRef.current.slickPrev()}>*/}
                                {/*        <AiFillCaretLeft />*/}
                                {/*    </button>*/}
                                {/*    <button className="next" onClick={() => sliderRef.current.slickNext()}>*/}
                                {/*        <AiFillCaretRight />*/}
                                {/*    </button>*/}
                                {/*</div>*/}
                            </div>
                        </div>
                    ) : (
                        <p>No products available</p>
                    )}
                </div>
            ))}
        </div>
    );
}

export default ProductSlider;
