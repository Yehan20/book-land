import { Provider, useDispatch, useSelector } from 'react-redux';
import Routes from './routes';
import Store from './store/store';
import theme from './theme/theme';
import { ThemeProvider } from '@emotion/react';
import { RouterProvider } from 'react-router-dom';
import { getUser } from './features/authSlice';
import { StyledEngineProvider, CircularProgress, Box } from '@mui/material';
import { useEffect } from 'react';

function AppWrapper() {
  const dispatch = useDispatch();
  const { loading } = useSelector((state) => state.auth);

  useEffect(() => {
    dispatch(getUser());
  }, [dispatch]);

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" height="100vh">
        <CircularProgress />
      </Box>
    );
  }

  return <RouterProvider router={Routes} />;
}

function App() {
  return (
    <Provider store={Store}>
      <StyledEngineProvider>
        <ThemeProvider theme={theme}>
          <AppWrapper />
        </ThemeProvider>
      </StyledEngineProvider>
    </Provider>
  );
}

export default App;
