
import { Navigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import PropTypes from 'prop-types'; 


const CustomerRoute = ({ children }) => {
  const user = useSelector((state) => state.auth.user); 

  if (!user || user.role_name !== 'customer') {
    return <Navigate to="/" replace />;
  }
  
  return children
};
CustomerRoute.propTypes = {
  children: PropTypes.node.isRequired,
};

export default CustomerRoute;
