# Whitelist-dAAp

* Web3 Modal : A single Web3 / Ethereum provider solution for all Wallets. https://github.com/Web3Modal/web3modal
* Provider : A Provider is an Ethereum node connection that allows you to read data from its state. You will use a Provider to do things like calling read-only functions in smart contracts, fetching balances of accounts, fetching transaction details, etc. Wallets like Metamask, by default, inject a Provider into your browser. Therefore, dApps can use your Metamask Provider to read values from the blockchain network your wallet is connected to.
* Signer : A Signer is an Ethereum node connection that allows you to write data to the blockchain. You will use a Signer to do things like calling write functions in smart contracts, transferring ETH between accounts, etc. To do so, the Signer needs access to a Private Key it can use for making transactions on behalf of an account.For this, Metamask also allows websites to request a Signer. So when a dApp attempts to send a transaction to the blockchain, the Metamask window pops up asking the user to confirm the action.

    **Web3 Provider :**


    The Web3Provider is meant to ease moving from a web3.js based application to ethers by wrapping an existing Web3-compatible (such as a Web3HttpProvider, Web3IpcProvider or Web3WsProvider) and exposing it as an ethers.js Provider which can then be used with the rest of the library.


       new ethers.providers.Web3Provider( externalProvider [ , network ] )
      Create a new Web3 Provider, which wraps an EPI-1193 Provider or Web3 Provider-compatible Provider.


    **Use Reference in React:**


         const refContainer = useRef(initialValue)
      useRef returns a mutable ref object whose .current property is initialized to the passed argument (initialValue). 
      The returned object will persist for the full lifetime of the component.


    First we create reference and name it as web3ModelRef


         Create a reference to the Web3 Modal (used for connecting to Metamask) which persists as long as the page is open
            const web3ModalRef = useRef();


    In useEffect we set the current state of web3ModalRef :


          Assign the Web3Modal class to the reference object by setting it's `current` value 
          The `current` value is persisted throughout as long as this page is open
            web3ModalRef.current = new Web3Modal({
            network: "rinkeby",
            providerOptions: {},
            disableInjectedProvider: false,
            }) //as we want injected provider by the metamask_


    Then we call connect wallet function which does the following work:

         Get the provider from web3Modal, which in our case is MetaMask
         When used for the first time, it prompts the user to connect their wallet
            await getProviderOrSigner()


    getProviderorSigner() function:

         Connect to Metamask
         Since we store `web3Modal` as a reference, we need to access the `current` value to get access to the underlying object
            const provider = await web3ModalRef.current.connect();  -> this we got the provider from web3mod
         So you're using web3modal as your provider, 
         the default provider option would just inject metamask into your browser. 
         It's stored in the provider variable.
         wrapping an existing provider and exposing it as ether.js Provider. create a new instance (reference) of the provider
            const web3Provider = new providers.Web3Provider(provider)
      
