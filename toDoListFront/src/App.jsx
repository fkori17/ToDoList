import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import CompletedLine from "./components/CompletedLine.jsx";
import LingeringLine from "./components/LingeringLine.jsx";
import Line from "./components/Line.jsx";
import "./App.css";
function App() {
  const [data, sethata] = useState(null);

  function writeLine() {
    fetch("http://127.0.0.1:8000/api")
      .then((response) => response.json())
      .then((json) => sethata(json))
      .catch((error) => console.error("Error fetching data:", error));

    if (!data) {
      return (
        <>
          <p>Loading...</p>
        </>
      );
    }
    return (
      <>
        {data.map((row) => (
          <Line
            key={row.id}
            id={row.id}
            title={row.title}
            description={row.description}
            is_completed={row.is_completed}
            assigned_to={row.assigned_to}
            created_at={row.created_at}
            updated_at={row.updated_at}
          />
        ))}
      </>
    );
  }

  function writeCompleted() {
    fetch("http://127.0.0.1:8000/api/completed")
      .then((response) => response.json())
      .then((json) => sethata(json))
      .catch((error) => console.error("Error fetching data:", error));
    if (!data) {
      return (
        <>
          <p>Loading...</p>
        </>
      );
    }
    return (
      <>
        {data.map((row) => (
          <CompletedLine
            key={row.id}
            id={row.id}
            title={row.title}
            description={row.description}
            assigned_to={row.assigned_to}
            created_at={row.created_at}
          />
        ))}
      </>
    );
  }

  function writeLingering() {
    fetch("http://127.0.0.1:8000/api/lingering")
      .then((response) => response.json())
      .then((json) => sethata(json))
      .catch((error) => console.error("Error fetching data:", error));
    if (!data) {
      return (
        <>
          <p>Loading...</p>
        </>
      );
    }
    return (
      <>
        {data.map((row) => (
          <LingeringLine
            key={row.id}
            id={row.id}
            title={row.title}
            description={row.description}
            assigned_to={row.assigned_to}
            created_at={row.created_at}
            task_count={row.task_count}
          />
        ))}
      </>
    );
  }
  return (
    <>
      <h1>To-Do List</h1>
      <main>
        <article>
          <aside>
            <h3>Fennmaradt feladatok</h3>
            <table>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
              </tr>
              {writeLingering()}
            </table>
          </aside>
          <aside>
            <h3>Teljesített feladatok</h3>
            <table>
              <tr>
                <th>ID</th>
                <th>Feladat</th>
                <th>Részletek</th>
                <th>Felelős</th>
                <th>Létrehozva</th>
              </tr>
              {writeCompleted()}
            </table>
          </aside>
        </article>
        <article>
          <h3>Összes feladat</h3>
          <table>
            <tr>
              <th>ID</th>
              <th>Feladat</th>
              <th>Részletek</th>
              <th>Állapot</th>
              <th>Felelős</th>
              <th>Létrehozva</th>
              <th>Frissítve</th>
            </tr>
            {writeLine()}
          </table>
        </article>
      </main>
    </>
  );
}

export default App;
