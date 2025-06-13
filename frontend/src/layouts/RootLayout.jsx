import React from 'react'
import { Outlet } from 'react-router-dom'
import Header from '../components/header/Header'
import Footer from '../components/footer/footer'
import { Container } from '@mui/material'


const RootLayout = () => {
  
    return (
        <React.Fragment>
            <Header />
             <Container sx={{ paddingTop:10 }}>
                <Outlet />
             </Container>
            <Footer />
        </React.Fragment>
    )
}

export default RootLayout
