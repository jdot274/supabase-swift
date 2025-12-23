import Foundation
import XCTest

class IntegrationTestCase: XCTestCase {
  override func setUp() async throws {
    try await super.setUp()

    try XCTSkipUnless(
      ProcessInfo.processInfo.environment["INTEGRATION_TESTS"] != nil,
      "INTEGRATION_TESTS not defined. Set this environment variable to run integration tests."
    )
  }
}
