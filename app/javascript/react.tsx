// @ts-ignore
import React from "react";
// @ts-ignore
import ReactDOM from "react-dom/client";
import Hello from "./react/Hello";

type Components = Record<string, React.ElementType>;

export default function mount(components: Components): void {
    document.addEventListener("DOMContentLoaded", () => {
        const mountPoints = document.querySelectorAll("[data-react-component]");
        mountPoints.forEach((mountPoint) => {
            const { dataset } = mountPoint as HTMLElement;
            const componentName = dataset.reactComponent;
            if (componentName) {
                const Component = components[componentName];
                if (Component) {
                    const props = JSON.parse(dataset.props as string);
                    const root = ReactDOM.createRoot(mountPoint);
                    root.render(<Component {...props} />);
                } else {
                    console.warn(
                        "WARNING: No component found for: ",
                        dataset.reactComponent,
                        components
                    );
                }
            }
        });
    });
}

// @ts-ignore

mount({
    Hello,
});

