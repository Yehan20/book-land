import React, { Suspense } from "react";
import {
  createBrowserRouter,
  createRoutesFromElements,
  Route,
} from "react-router-dom";

import RootLayout from "../layouts/RootLayout";
import CircularProgress from "@mui/material/CircularProgress";

// Lazy Load To improve perormance
const Login = React.lazy(() => import("../pages/Login"));
const Home = React.lazy(() => import("../pages/Home"));
const Register = React.lazy(() => import("../pages/Register"));

import NotFound from "../pages/NotFound";
import BookDetail from "../pages/BookDetail";
import RentedBooks from "../pages/RentedBooks";
import CustomerRoute from "./CustomerRoute";
import PublicRoute from "./PublicRoute";

const Routes = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" element={<RootLayout />}>
      <Route
        index
        element={
          <Suspense fallback={<CircularProgress />}>
            <Home />
          </Suspense>
        }
      />

      <Route
        path="login"
        element={
          <Suspense fallback={<CircularProgress />}>
            <PublicRoute>
              <Login />
            </PublicRoute>{" "}
          </Suspense>
        }
      />

      <Route
        path="register"
        element={
          <Suspense fallback={<CircularProgress />}>
            <PublicRoute>
              <Register />
            </PublicRoute>{" "}
          </Suspense>
        }
      />

      <Route
        path="rented-books"
        element={
          <Suspense fallback={<CircularProgress />}>
            <CustomerRoute>
              <RentedBooks />
            </CustomerRoute>
          </Suspense>
        }
      />

      <Route
        path="books/:id"
        element={
          <Suspense fallback={<CircularProgress />}>
            <BookDetail />
          </Suspense>
        }
      />

      <Route path="*" element={<NotFound />} />
    </Route>,
  ),
);

export default Routes;
