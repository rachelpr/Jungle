describe("home page navigation", () => {
  it("should visit the home page", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Should click on add button to add product to the cart", () => {
    cy.get(":nth-child(1) > div > .button_to > .btn").click({ force: true });
    cy.get(".end-0 > .nav-link").contains("My Cart (1)");
  });
});
