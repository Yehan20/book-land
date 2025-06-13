import React from 'react';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import CssBaseline from '@mui/material/CssBaseline';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import WavingHandIcon from '@mui/icons-material/WavingHand';
import Stack from '@mui/material/Stack';

import { links } from '../../data/data';
import { NavLink, useNavigate } from 'react-router-dom';
import { Button } from '@mui/material';
import LogoText from '../common/LogoText';
import { useSelector, useDispatch } from 'react-redux';
import { logoutUser } from '../../features/authSlice';

function Header() {
  const { user } = useSelector((state) => state.auth);
  const dispatch = useDispatch();
  const navigate = useNavigate();
  
  const handleLogout = () => {
    dispatch(logoutUser());
    navigate('/');
  };

  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <AppBar component="nav"  position="fixed">
        <Toolbar
          sx={{

            flexDirection: { xs: 'column', sm: 'row' },

            alignItems: { xs: 'flex-start', sm: 'center' },
            justifyContent: { xs: 'flex-start', sm: 'space-between' },
            py: { xs: 2, sm: 0 },
          }}
        >
          {/* LogoText */}
          <LogoText hasLink={true} size={"40"} />

          {/* Navigation Links and User Info */}
          <Stack
            direction={{ xs: 'column', sm: 'row' }} // Stack vertically on xs, horizontally on sm and up
            spacing={{ xs: 1.5, sm: 4 }} // Spacing between items: more space on small, less when stacked
            sx={{
              width: { xs: '100%', sm: 'auto' }, // Take full width on xs, auto width on sm and up
              alignItems: { xs: 'flex-start', sm: 'center' }, // Align text to left when stacked, center when row
              mt: { xs: 2, sm: 0 }, // Margin top on xs to separate from logo
            }}
          >
            {/* Links for unauthenticated users */}
            {!user && links.map((item) => (
              <NavLink
                className={'nav__link'}
                to={item.path}
                key={item.id}
                style={({ isActive }) => ({
                  color: isActive ? 'primary.main' : 'inherit',
                  textDecoration: 'none',
                  fontWeight: isActive ? 600 : 'normal',
                })}
              >
                {item.name}
              </NavLink>
            ))}

            {/* User Info and Logout for authenticated users */}
            {user && (
              <Stack
                direction={{ xs: 'column', sm: 'row' }}
                spacing={2}
                alignItems={{ xs: 'flex-start', sm: 'center' }}
              >
                <Typography sx={{ margin: 0, display: "flex", gap: 1, alignItems: 'center' }}>
                  Welcome {user.name} <WavingHandIcon color='black' />
                </Typography>

                {/* Customer only routes */}
                {user && user.role_name === 'customer' && (
                  <NavLink
                    to='/rented-books'
                    className={'custom__hover'}
                    style={{ color: 'inherit', textDecoration: 'none' }}
                  >
                    My Rented books
                  </NavLink>
                )}

                <Button onClick={handleLogout} variant='contained' color="secondary">
                  Logout
                </Button>
              </Stack>
            )}
          </Stack>
        </Toolbar>
      </AppBar>
    </Box>
  );
}

export default Header;