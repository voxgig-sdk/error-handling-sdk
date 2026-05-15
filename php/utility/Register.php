<?php
declare(strict_types=1);

// ErrorHandling SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

ErrorHandlingUtility::setRegistrar(function (ErrorHandlingUtility $u): void {
    $u->clean = [ErrorHandlingClean::class, 'call'];
    $u->done = [ErrorHandlingDone::class, 'call'];
    $u->make_error = [ErrorHandlingMakeError::class, 'call'];
    $u->feature_add = [ErrorHandlingFeatureAdd::class, 'call'];
    $u->feature_hook = [ErrorHandlingFeatureHook::class, 'call'];
    $u->feature_init = [ErrorHandlingFeatureInit::class, 'call'];
    $u->fetcher = [ErrorHandlingFetcher::class, 'call'];
    $u->make_fetch_def = [ErrorHandlingMakeFetchDef::class, 'call'];
    $u->make_context = [ErrorHandlingMakeContext::class, 'call'];
    $u->make_options = [ErrorHandlingMakeOptions::class, 'call'];
    $u->make_request = [ErrorHandlingMakeRequest::class, 'call'];
    $u->make_response = [ErrorHandlingMakeResponse::class, 'call'];
    $u->make_result = [ErrorHandlingMakeResult::class, 'call'];
    $u->make_point = [ErrorHandlingMakePoint::class, 'call'];
    $u->make_spec = [ErrorHandlingMakeSpec::class, 'call'];
    $u->make_url = [ErrorHandlingMakeUrl::class, 'call'];
    $u->param = [ErrorHandlingParam::class, 'call'];
    $u->prepare_auth = [ErrorHandlingPrepareAuth::class, 'call'];
    $u->prepare_body = [ErrorHandlingPrepareBody::class, 'call'];
    $u->prepare_headers = [ErrorHandlingPrepareHeaders::class, 'call'];
    $u->prepare_method = [ErrorHandlingPrepareMethod::class, 'call'];
    $u->prepare_params = [ErrorHandlingPrepareParams::class, 'call'];
    $u->prepare_path = [ErrorHandlingPreparePath::class, 'call'];
    $u->prepare_query = [ErrorHandlingPrepareQuery::class, 'call'];
    $u->result_basic = [ErrorHandlingResultBasic::class, 'call'];
    $u->result_body = [ErrorHandlingResultBody::class, 'call'];
    $u->result_headers = [ErrorHandlingResultHeaders::class, 'call'];
    $u->transform_request = [ErrorHandlingTransformRequest::class, 'call'];
    $u->transform_response = [ErrorHandlingTransformResponse::class, 'call'];
});
