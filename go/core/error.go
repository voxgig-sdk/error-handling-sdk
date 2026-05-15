package core

type ErrorHandlingError struct {
	IsErrorHandlingError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewErrorHandlingError(code string, msg string, ctx *Context) *ErrorHandlingError {
	return &ErrorHandlingError{
		IsErrorHandlingError: true,
		Sdk:              "ErrorHandling",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *ErrorHandlingError) Error() string {
	return e.Msg
}
