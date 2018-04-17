Kickstarter Ethereum Project:

To Start the Project:
- npm i
- npm start

Problem: In crowfunding platforms such as kickstarter, once the money is raised from contributors, there is no guarantee that the person that started the crowdfunding campaign will use the money appropriately. Sometimes people are outright malicious and can simply take the money and "run away".

Solution: To Prevent this, we have created the `Kickstarter Ethereum Project` with which the contributors give their ethereum to the platform and know exactly where the money is going. By sending their money to an ethereum contract, they know ahead of time based on contract details where the money will be going to, providing an improved assurance and improved standards on how crowdfunding campaigns can be run.

Rules:
1. The Person that creates the Campaign becomes the manager
2. Once a Campaign is created, multiple people can contribute to the campaign by clicking `View Campaign`
3. Within each campaign page, you can look at related funding Requests by clicking `View Requests`
4. Once Manager creates a request, people that contributed to Campaign, can Approve the Request
5. Finally, once the request has 50% or more approvals, Manager can finalize the request so recepient can receive the funds

Project is build with the help of:
- Next.js (React Boilerplate library)
- Infura for wallet provider setup
- Ethereum course by Stephen Grider: https://www.udemy.com/ethereum-and-solidity-the-complete-developers-guide/