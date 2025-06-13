// src/routes/CustomerRoute.js
import { Navigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import PropTypes from 'prop-types'; 

const PublicRoute = ({ children }) => {
  const user = useSelector((state) => state.auth.user);

  if (user) {
    return <Navigate to="/" replace />;
  }

  return children;
};

PublicRoute.propTypes = {
  children: PropTypes.node.isRequired, 
};

export default PublicRoute;
