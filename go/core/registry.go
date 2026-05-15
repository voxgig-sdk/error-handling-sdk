package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewLogoGenerationEntityFunc func(client *ErrorHandlingSDK, entopts map[string]any) ErrorHandlingEntity

