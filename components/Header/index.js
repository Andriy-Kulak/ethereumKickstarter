import React from 'react';
import { Link } from '../../routes';
// import logo from './images/ethLogo.png'

export default () => {
  return (
    <div className="ak-header">
      <div>
        <Link route="/">
          <img className="ak-header-img" src="/static/ethLogo.png" />
        </Link>
      </div>
      <div style={{display: 'flex'}}> 
          <Link route="/">
            <div className="ak-nav-item">
              <a>Campaigns</a>
            </div>
          </Link>
        
        
          <Link route="/campaigns/new">
            <div className="ak-nav-item">
              <a className="item">Create New</a>
            </div>
          </Link>
        
      </div>
    </div>
  );
};
