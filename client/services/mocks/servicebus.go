// Code generated by MockGen. DO NOT EDIT.
// Source: github.com/cloudquery/cq-provider-azure/client/services (interfaces: NamespacesClient)

// Package mocks is a generated GoMock package.
package mocks

import (
	context "context"
	reflect "reflect"

	servicebus "github.com/Azure/azure-sdk-for-go/services/preview/servicebus/mgmt/2021-06-01-preview/servicebus"
	gomock "github.com/golang/mock/gomock"
)

// MockNamespacesClient is a mock of NamespacesClient interface.
type MockNamespacesClient struct {
	ctrl     *gomock.Controller
	recorder *MockNamespacesClientMockRecorder
}

// MockNamespacesClientMockRecorder is the mock recorder for MockNamespacesClient.
type MockNamespacesClientMockRecorder struct {
	mock *MockNamespacesClient
}

// NewMockNamespacesClient creates a new mock instance.
func NewMockNamespacesClient(ctrl *gomock.Controller) *MockNamespacesClient {
	mock := &MockNamespacesClient{ctrl: ctrl}
	mock.recorder = &MockNamespacesClientMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockNamespacesClient) EXPECT() *MockNamespacesClientMockRecorder {
	return m.recorder
}

// List mocks base method.
func (m *MockNamespacesClient) List(arg0 context.Context) (servicebus.SBNamespaceListResultPage, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "List", arg0)
	ret0, _ := ret[0].(servicebus.SBNamespaceListResultPage)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// List indicates an expected call of List.
func (mr *MockNamespacesClientMockRecorder) List(arg0 interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "List", reflect.TypeOf((*MockNamespacesClient)(nil).List), arg0)
}