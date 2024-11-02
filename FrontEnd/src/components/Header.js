import React, { useEffect, useState } from 'react';
import {Link, useNavigate, useParams} from "react-router-dom";
import '../style/Header.css'
import { useKeycloak } from "@react-keycloak/web";
import { BsFillPersonFill } from 'react-icons/bs';
import { BiCartAlt } from "react-icons/bi";
import { FaSignOutAlt } from "react-icons/fa";
import { Dropdown, DropdownButton } from 'react-bootstrap';



const Header = () => {
    const { keycloak, initialized } = useKeycloak();
    const [showSearchResults, setShowSearchResults] = useState(false);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchResults, setSearchResults] = useState([]);
    const [showResults, setShowResults] = useState(false);
    const postAPI = 'http://localhost:8081/api/sp/product/list';
    const [productData, setProductData] = useState([]);
    const [showDropdownOptions, setShowDropdownOptions] = useState(false); // State để kiểm soát hiển thị dropdown options
    const [cartInfo, setCartInfo] = useState(null);
    const [user, setUser] = useState(null);
    const navigate = useNavigate();
    const logoutOptions = { redirectUri : "http://localhost:3000/" }
    const [adminCheck, setAdminCheck] = useState(false)


    let id_user = '';
    const sendUserInfo = async (event) => {
        // eslint-disable-next-line react-hooks/rules-of-hooks
        // Xử lý đăng nhập ở đây


        let jsonObject = {
            "username": keycloak.tokenParsed.preferred_username,
            "email": keycloak.tokenParsed.email,
            "uid": keycloak.tokenParsed.sub,
            "name": keycloak.tokenParsed.name
        }
        id_user = keycloak.tokenParsed.sub;
        // console.log(jsonObject);

        const res = await fetch("http://localhost:8081/api/login/getAccount", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonObject)
        })
        const login_data = await res.json();
        console.log(keycloak.tokenParsed.resource_access.React.roles);

        setUser(login_data);
    }


    const sendCartInfo = async (event) => {
        // eslint-disable-next-line react-hooks/rules-of-hooks
        // Xử lý đăng nhập ở đây


        let jsonObject = {
            "username": keycloak.tokenParsed.preferred_username,
            "email": keycloak.tokenParsed.email,
            "uid": keycloak.tokenParsed.sub,
            "name": keycloak.tokenParsed.name
        }
        const res = await fetch("http://localhost:8081/api/cart/login/getAccount", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(jsonObject)
        })
        const login_data = await res.json();
        localStorage.setItem('cartId',login_data);
        setCartInfo(login_data);
    }

    useEffect( () => {
        if (keycloak.authenticated) {
            for(let i=0;i<keycloak.tokenParsed.resource_access.React.roles.length;i++){
                if(keycloak.tokenParsed.resource_access.React.roles[i] === "Admin"){
                    setAdminCheck(true);
                    localStorage.setItem('checkAdmin', true);
                }
            }
            sendUserInfo();
            sendCartInfo();
        }
        else{
            localStorage.removeItem('cartId');
        }
    }, [keycloak.authenticated]);

    const handleLogout = (logoutOptions) =>{
        localStorage.removeItem('checkAdmin');
        keycloak.logout(logoutOptions);
    }




    useEffect(() => {
        setShowSearchResults(searchResults.length > 0);
    }, [searchResults]);




    const toggleDropdownOptions = () => {
        setShowDropdownOptions(!showDropdownOptions);
    };
    const handleSearch = (event) => {
        const value = event.target.value;
        setSearchTerm(value);

        // Lọc các phần tử trong mảng dựa trên giá trị nhập vào
        const results = value
            ? productData.filter((item) =>
                item.name.toLowerCase().includes(value.toLowerCase())
            )
            : [];

        setSearchResults(results);
        setShowResults(results.length > 0);
    }

    const handleChangePassword = () =>{
        keycloak.login({
            action: "UPDATE_PASSWORD",
        })
    }

    useEffect(() => {
        async function getProduct() {
            const response = await fetch(postAPI);
            const data = await response.json();
            const groupedProducts = groupBy(data, 'name');

            const uniqueProducts = Object.values(groupedProducts).map(group => group[0]);

            setProductData(uniqueProducts);
        }
        getProduct();

    }, []);

    // useEffect(() => {
    //     async function getCart() {
    //         const response = await fetch(`http://localhost:8081/api/cart/${id}`);
    //         const data = await response.json();
    //         setCartInfo(data);
    //     }
    //     getCart();
    //     console.log(cartInfo);
    // }, [id]);

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
            {!adminCheck ? (
                <div className="container"  >
                    <div>
                        <Link to="/" className="logo">
                            <img
                                id="logo"
                                src="https://thumb.danhsachcuahang.com/image/2020/03/20200314_f823589b2039056e387d7663964ac83a_1584152952.jpg"
                                alt="Logo"
                            />
                        </Link>
                    </div>

                    <div className="search-bar-container">
                        <div className="search-bar-hint-container">
                            <input
                                type="text"
                                placeholder="Nhập từ khóa về sản phẩm..."
                                value={searchTerm}
                                onChange={handleSearch}
                                className="search-input"
                            />
                            {showSearchResults  && (
                                <div className="search-results">
                                    {searchResults.map((item) => (
                                        <div key={item.id} className="search-result-item">
                                            <div className="product-info">
                                                <Link to={`/product/${item.id}`} className="product-name">
                                                    <img src={item.image} alt={item.name} className="product-image" />
                                                    <div className="product-title">
                                                        <p>{item.name}</p>
                                                        <div>Giá: {item.price}</div>
                                                    </div>
                                                </Link>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            )}

                        </div>

                        <button onClick={() => console.log('Tìm kiếm:', searchTerm)} className="search-button">
                            Tìm kiếm
                        </button>

                        {/* Hiển thị gợi ý và hình ảnh sản phẩm */}
                        {adminCheck &&
                        <button onClick={() => navigate(`/admin`)} className="admin-button">
                            Chuyển sang giao diện quản lý
                        </button>}

                    </div>

                    <div className="login-logout-btn">
                        {!keycloak.authenticated && (
                            <button
                                type="button"
                                className="login-button"
                                onClick={() => keycloak.login()}>
                                <BsFillPersonFill />
                                Login
                            </button>
                        )}


                        {!!keycloak.authenticated && (
                            <div className="Cart-User-Container">
                                <Link
                                    to = {`/cart/${cartInfo}`}
                                    className="CartButton"
                                ><BiCartAlt /></Link>

                                <DropdownButton
                                    title={keycloak.tokenParsed.preferred_username}
                                    className="logout-dropdown"
                                    onClick={toggleDropdownOptions}
                                >
                                    {!!showDropdownOptions && (
                                        <div className="DropdownItemContainer" style={{zIndex:"99"}}>
                                            <Dropdown.Item className="dropdown-item" onClick={() => navigate(`/userinfo/${user.id}`)}>
                                                    Xem thông tin cá nhân
                                            </Dropdown.Item>

                                            <Dropdown.Item className="dropdown-item" onClick={handleChangePassword} >
                                                Đổi mật khẩu
                                            </Dropdown.Item>

                                            <Dropdown.Item className="dropdown-item" onClick={() => navigate(`/orderHistory`)} >
                                                Xem danh sách yêu cầu mua hàng
                                            </Dropdown.Item>

                                            <Dropdown.Item className="dropdown-item" id="covered-item" onClick={() => handleLogout(logoutOptions)} >
                                                <FaSignOutAlt />
                                                Logout
                                            </Dropdown.Item>

                                        </div>
                                    )}
                                </DropdownButton>
                            </div>
                        )}
                    </div>
                </div>
            ) : (
                <>
                    <div className="container"  style={{display: "flex", justifyContent: "space-between"}}>
                        <div style={{marginLeft: "20px"}}>
                            <Link to="/manageOrder" className="logo">
                                <img
                                    id="logo"
                                    src="https://thumb.danhsachcuahang.com/image/2020/03/20200314_f823589b2039056e387d7663964ac83a_1584152952.jpg"
                                    alt="Logo"
                                />
                            </Link>
                        </div>

                        {/*<div className="Admin-Title">*/}
                        {/*    <h1>Admin Manage</h1>*/}
                        {/*</div>*/}

                        <div className="Cart-User-Container">
                            <DropdownButton
                                title={keycloak.tokenParsed.preferred_username}
                                className="logout-dropdown"
                                onClick={toggleDropdownOptions}
                            >
                                {!!showDropdownOptions && (
                                    <div className="DropdownItemContainer" style={{zIndex:"99"}}>

                                        <Dropdown.Item className="dropdown-item" onClick={handleChangePassword} >
                                            Đổi mật khẩu
                                        </Dropdown.Item>

                                        <Dropdown.Item className="dropdown-item" id="covered-item" onClick={() => handleLogout(logoutOptions)} >
                                            <FaSignOutAlt />
                                            Logout
                                        </Dropdown.Item>

                                    </div>
                                )}
                            </DropdownButton>
                        </div>
                    </div>
                </>
            )}
        </>
    );
}

export default Header;

