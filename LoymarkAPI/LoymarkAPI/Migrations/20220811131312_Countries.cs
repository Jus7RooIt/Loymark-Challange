using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LoymarkAPI.Migrations
{
    public partial class Countries : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Contries",
                columns: table => new
                {
                    CountryCode = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Contries", x => x.CountryCode);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Contries");
        }
    }
}
