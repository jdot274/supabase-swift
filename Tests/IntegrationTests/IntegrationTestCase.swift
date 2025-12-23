import Foundation
import XCTest

open class IntegrationTestCase: XCTestCase {
  static let integrationFlag = "INTEGRATION_TESTS"

  override open func setUp() async throws {
    try await super.setUp()

    try XCTSkipUnless(
      ProcessInfo.processInfo.environment[Self.integrationFlag] != nil,
      "\(Self.integrationFlag) not defined. Set this environment variable to run integration tests."
    )
  }
}
