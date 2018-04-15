import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface),
  '0x191981D8950572078D0dc904dbBFb054fDD4efC8'
);

export default instance;
