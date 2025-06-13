import React from 'react'
import { Box, Typography } from '@mui/material'
import LogoText from '../common/LogoText'

const Footer = () => {
  return (
    <Box sx={{ backgroundColor: (theme) => theme.palette.primary.main,padding:"20px",marginTop:"auto" }}>
       <Typography variant='div' sx={{ textAlign:'center',display:'flex',alignItems:'center',color:'white', flexDirection: { xs: 'column', sm: 'row' }}}> 
        <LogoText size={'30'} />  2025 all rights reserved </Typography>
    </Box>
  )
}

export default Footer