import { ErrorHandlingEntityBase } from '../ErrorHandlingEntityBase';
import type { ErrorHandlingSDK } from '../ErrorHandlingSDK';
import type { Control } from '../types';
import type { LogoGeneration, LogoGenerationLoadMatch } from '../ErrorHandlingTypes';
declare class LogoGenerationEntity extends ErrorHandlingEntityBase<LogoGeneration> {
    constructor(client: ErrorHandlingSDK, entopts: any);
    make(this: LogoGenerationEntity): LogoGenerationEntity;
    load(this: any, reqmatch?: LogoGenerationLoadMatch, ctrl?: Control): Promise<LogoGenerationEntity>;
}
export { LogoGenerationEntity };
