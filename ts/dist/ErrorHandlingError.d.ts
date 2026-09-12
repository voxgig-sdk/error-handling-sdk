import { Context } from './Context';
declare class ErrorHandlingError extends Error {
    isErrorHandlingError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { ErrorHandlingError };
