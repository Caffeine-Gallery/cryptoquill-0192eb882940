import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Post {
  'title' : string,
  'body' : string,
  'author' : string,
  'timestamp' : bigint,
}
export interface _SERVICE {
  'createPost' : ActorMethod<[string, string, string], boolean>,
  'getPosts' : ActorMethod<[], Array<Post>>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
