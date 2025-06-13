import React from "react";
import { Grid2 as Grid, Typography } from "@mui/material";
import RegisterForm from "../../components/auth/RegisterForm";

const Register = () => {
  return (
    <React.Fragment>
      <Typography
        sx={{ sm: { padding: "30px 0" } }}
        variant="h3"
        textAlign={"center"}
        fontWeight={600}
        component={"h1"}
      >
        Register
      </Typography>
      <Grid container spacing={{ xs: 2, sm: 4, md: 10 }} sx={{ marginTop: "40px", paddingBottom: "40px" }}>


      
        <RegisterForm />

      </Grid>
    </React.Fragment>
  );
};

export default Register;
