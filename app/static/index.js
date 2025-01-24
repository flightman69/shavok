document.addEventListener("DOMContentLoaded", () => {
    const title = document.querySelector("h1");
    setTimeout(() => {
        title.textContent = "Welcome to Shavok End Points!";
    }, 3000);

    document.querySelectorAll("tbody tr").forEach(row => {
        row.addEventListener("click", () => {
            alert(`You clicked on ${row.cells[0].textContent}`);
        });
    });
});

