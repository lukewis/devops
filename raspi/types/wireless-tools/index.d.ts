declare module "wireless-tools" {
  interface IModule {
      iwlist: IWList;
  }

  interface IWList {
    scan: (options: string | IScanOptions, callback: ScanCallback) => void;
  }
  type ScanCallback = (error: Error | null, networks: INetwork[]) => void;
  interface IScanOptions {
    iface: string;
    show_hidden: boolean;
  }

  interface INetwork {
    address: string;
    ssid: string;
    mode: string;
    frequency: number;
    channel: number;
    security: string;
    quality: number;
    signal: number;
  }

  const module: IModule;
  export = module;
}
