declare module "node-df" {
  interface IModule {
    (callback: (error: Error | null, response: IVolume[]) => void): void;
  }

  interface IVolume {
    filesystem: string;
    size: number;
    used: number;
    available: number;
    capacity: number;
    mount: string;
  }

  const module: IModule;
  export = module;
}
