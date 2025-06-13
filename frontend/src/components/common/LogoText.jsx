import React from 'react'
import { Typography } from '@mui/material'
import { Link } from 'react-router-dom'

const LogoText = ({ size}) => {
  return (
    <Typography
      sx={{
        fontFamily: "Rajdhani, sans-serif",
        fontWeight: "400",
        fontStyle: "normal",
        fontSize: `${size}px`,

        flexGrow: 1, display: { sm: 'block' }, textAlign: { xs: 'right', sm: 'left' },
        '& a': {
          textDecoration: 'none',
          color: "#fff"
        }
      }}
      component="div"

    ><Link to={'/'}>BookLand</Link></Typography>
  )
}

export default LogoText