import { Grid2, Typography } from '@mui/material'
import React from 'react'

const IntroSection = () => {
    return (

        <Grid2 container>
            <Grid2 size={{ xs: 12 }}>
                <Typography variant="h3"
                    textAlign={"center"}
                    fontWeight={600}
                    component={"h1"}
                    gutterBottom
                >

                    Welcome to BooksLand


                </Typography>

                <Typography variant='h6' component='p' align='center' >
                    Explore and rent different books . many categories to see from 
                </Typography>
            </Grid2>
        </Grid2>


    )
}

export default IntroSection