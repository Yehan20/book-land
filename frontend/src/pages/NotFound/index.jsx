import React from 'react'
import { Grid2, Typography } from '@mui/material'
import { Link } from 'react-router-dom'
import HomeIcon from '@mui/icons-material/Home';
import theme from '../../theme/theme';

const NotFound = () => {
  return (
     <Grid2 cotainer>
        <Grid2 size={{ xs:12 }}>
             <Typography textAlign={"center"} sx={{ fontWeight:700 ,padding:"50px 0",lineHeight:1.7,fontSize:'clamp(1.5rem,2.5vw,3rem)'}} >
                  404 Sorry, the page you are looking for does not exist  <br />
                 <Link className='error__link' style={{ display:"flex",alignItems:"center",justifyContent:"center",color:theme.palette.primary.main }} to='/'>
                 <HomeIcon fontSize='25px'/>   Return Home 
                 </Link>
             </Typography>
        </Grid2>
     </Grid2>
  )
}

export default NotFound