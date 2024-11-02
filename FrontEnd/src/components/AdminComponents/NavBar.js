
import React from 'react';
import { Link } from 'react-router-dom';
import '../../style/AdminStyle/NavBar.css';

const NavBar = () => {
    return (
        <nav className="navbar">
            <ul className="nav-links">
                <li>
                    <Link to="/">Trang chủ</Link>
                </li>
                <li>
                    <Link to="/about">Giới thiệu</Link>
                </li>
                <li>
                    <Link to="/contact">Liên hệ</Link>
                </li>
            </ul>
        </nav>
    );
};

export default NavBar;