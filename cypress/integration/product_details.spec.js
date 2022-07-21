describe("home page navigation", () => {
  it("should visit the home page", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Should click on a product partial", () => {
    cy.get(":nth-child(1) > a > img").click();
  });
});
