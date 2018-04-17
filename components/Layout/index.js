import React from 'react';
import Head from 'next/head';
import Header from '../Header';

export default props => {
  return (
    <div className="ak-layout">
      <Head>
        <link
          rel="stylesheet"
          href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.12/semantic.min.css"
        />
        <link rel="stylesheet" type="text/css" href="/static/basicStyles/index.css" />
      </Head>

      <Header />
      {props.children}
    </div>
  );
};
