import React, {useEffect, useState} from 'react';
import {Link, useNavigate} from "react-router-dom";
import "../style/Nav.css";
import {useKeycloak} from "@react-keycloak/web";

const Nav = () =>{

    const [selectedLink, setSelectedLink] = useState(null);
    const { keycloak, initialized } = useKeycloak();
    const [adminCheck, setAdminCheck] = useState(false)



    const linkStyle = {
        textDecoration: 'none', // Xóa gạch chân cho từng link
        color: 'grey', // Đổi màu chữ thành màu xanh
        fontWeight: 'bold', // In đậm chữ
        fontFamily: 'Time New Roman',
        fontSize: '20px',
        transition: 'color 0.3s', // Thêm hiệu ứng chuyển đổi màu trong 0.3s
        width: '30%',
        textAlign: 'center',
        padding: '5px'
    }


    const handleLinkClick = (link) => {
        setSelectedLink(link);
    };

    useEffect( () => {
        if (keycloak.authenticated) {
            for (let i = 0; i < keycloak.tokenParsed.resource_access.React.roles.length; i++) {
                if (keycloak.tokenParsed.resource_access.React.roles[i] === "Admin") {
                    setAdminCheck(true);
                }
            }
        }
    })



    return (
        <>
            {!adminCheck ? (
                <div className="navStyle">
                    <Link to="/" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'} >Trang chủ</Link>
                    <Link to="/product/type/MacBook" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Mac</Link>
                    <Link to="/product/type/Iphone" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Iphone</Link>
                    <Link to="/product/type/Samsung" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Samsung</Link>
                    <Link to="/" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Watch</Link>
                    <Link to="/" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>iPad</Link>
                    <Link to="/product/type/AirPods" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>AirPods</Link>
                    <Link to="/" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Apple TV</Link>
                    <Link to="/" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Accessories</Link>
                    <Link to="/" style={linkStyle} onMouseOver={(e) => e.target.style.color = 'white'}
                          onMouseOut={(e) => e.target.style.color = 'grey'}>Tin tức</Link>
                </div>
            ) : (
                <>
                    <div className="navStyle">
                        <Link
                            to="/manageOrder"
                            style={{
                                ...linkStyle,
                                backgroundColor: selectedLink === "home" ? "#b3b3b3" : "",
                            }}
                            onClick={() => handleLinkClick("home")}
                            onMouseOver={(e) => (e.target.style.color = "white")}
                            onMouseOut={(e) => (e.target.style.color = "grey")}
                        >
                            Danh sách yêu cầu mua hàng
                        </Link>
                        <Link
                            to="/manageProduct"
                            style={{
                                ...linkStyle,
                                backgroundColor: selectedLink === "product" ? "#b3b3b3" : "",
                            }}
                            onClick={() => handleLinkClick("product")}
                            onMouseOver={(e) => (e.target.style.color = "white")}
                            onMouseOut={(e) => (e.target.style.color = "grey")}
                        >
                            Danh sách sản phẩm
                        </Link>
                        <Link
                            to="/manageAccount"
                            style={{
                                ...linkStyle,
                                backgroundColor: selectedLink === "customer" ? "#b3b3b3" : "",
                            }}
                            onClick={() => handleLinkClick("customer")}
                            onMouseOver={(e) => (e.target.style.color = "white")}
                            onMouseOut={(e) => (e.target.style.color = "grey")}
                        >
                            Danh sách hồ sơ khách hàng
                        </Link>
                    </div>
                </>
            )}
        </>

    );
}

export default Nav;