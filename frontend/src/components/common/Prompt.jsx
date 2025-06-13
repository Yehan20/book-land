import React from 'react'
import { Typography, useTheme } from '@mui/material'
import { Link } from 'react-router-dom'

// Custom Message with a link used in login and sign up 

const Prompt = ({ Messagetext, linkText, url }) => {
    const theme = useTheme()
    return (
        <Typography variant="body1" >
            {Messagetext} 
            <Link style={{ textDecoration:'none',color:theme.palette.primary.main,fontWeight:500}} to={url} color="primary">
                {linkText}
            </Link>
        </Typography>
    )
}

export default Prompt